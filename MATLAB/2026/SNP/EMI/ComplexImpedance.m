classdef ComplexImpedance < handle
  % 复数阻抗类
  properties (SetAccess = private)
    real_part (1,1) double = 0
    imag_part (1,1) double = 0
  end
  
  properties (Dependent)
    magnitude  % 模值
    phase_deg  % 相位（度）
    phase_rad  % 相位（弧度）
  end

  properties (Constant)
    Z0 = 50
  end

  methods
    function obj = ComplexImpedance(Z)
      % 构造函数
      % Z可以是实数、复数或字符串
      if nargin > 0
        if isa(Z, 'double')
          if isscalar(Z)
            obj.real_part = real(Z);
            obj.imag_part = imag(Z);
          end
        elseif ischar(Z)
          % 解析字符串如 "50+25j"
          obj = obj.parseString(Z);
        end
      end
    end
        
    function Z = getMagnitude(obj)
      % 获取模值
      Z = sqrt(obj.real_part^2 + obj.imag_part^2);
    end
    
    function setImpedance(obj, R, X)
      % 设置阻抗值
      obj.real_part = R;
      obj.imag_part = X;
    end
        
    % Dependent属性的get方法
    function val = get.magnitude(obj)
      val = sqrt(obj.real_part^2 + obj.imag_part^2);
    end
    
    function val = get.phase_rad(obj)
      val = atan2(obj.imag_part, obj.real_part);
    end
    
    function val = get.phase_deg(obj)
      val = rad2deg(atan2(obj.imag_part, obj.real_part));
    end
    
    function S11 = ztos(obj)
      % 转换为反射系数
      Z = obj.real_part + 1j*obj.imag_part;
      S11 = (Z - ComplexImpedance.Z0) / (Z + ComplexImpedance.Z0);
    end
        
    function disp(obj)
      % 自定义显示
      if obj.imag_part >= 0
        fprintf('Z = %.2f + %.2fj Ω\n', obj.real_part, obj.imag_part);
      else
        fprintf('Z = %.2f - %.2fj Ω\n', obj.real_part, abs(obj.imag_part));
      end
      fprintf('|Z| = %.2f Ω, 相位 = %.1f°\n', obj.magnitude, obj.phase_deg);
    end
        
    % 运算符重载
    function result = plus(obj1, obj2)
        % 串联（阻抗相加）
        result = ComplexImpedance();
        result.real_part = obj1.real_part + obj2.real_part;
        result.imag_part = obj1.imag_part + obj2.imag_part;
    end
    
    function result = parallel(obj1, obj2)
        % 并联：1/Z = 1/Z1 + 1/Z2
        Y1 = 1 / (obj1.real_part + 1j*obj1.imag_part);
        Y2 = 1 / (obj2.real_part + 1j*obj2.imag_part);
        Z_total = 1 / (Y1 + Y2);
        result = ComplexImpedance(Z_total);
    end
  end
    
  methods (Access = private)
    function obj = parseString(obj, str)
      % 解析字符串格式的阻抗
      % 简化实现
      str = strrep(str, ' ', '');
      if contains(str, '+')
        parts = split(str, '+');
        obj.real_part = str2double(parts{1});
        tmp_imag_part = strrep(parts{2}, 'j', '');
        obj.imag_part = str2double(tmp_imag_part);
      elseif contains(str, '-')
        parts = split(str, '-');
        obj.real_part = str2double(parts{1});
        tmp_imag_part = strrep(parts{2}, 'j', '');
        obj.imag_part = -str2double(tmp_imag_part);
      end
    end
  end
end
