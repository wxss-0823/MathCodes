"""
Python functions defined in this labtalk.py file can be called from LabTalk
script without including the file name. For example:
    py.myfunc(arg1, arg2...)

However, if you want to put your functions in another Python file, put
the file in you User Files folder. Then use this calling convention:
    py.MyFunctions.myfunc(arg1, arg2...)
where the file name is MyFunctions.py.

Examples of functions are provided in the examples.py file. You may copy
and paste them here if you wish to test them. You may also use them as a
guide in creating your own functions.

You can assign a different file to be used instead of labtalk.py
by assigning the following LabTalk Python object property:
    Python.LTwf$=MyFunctions.py;
"""

# Here are two examples to get you started. You may delete them if you wish.

#Argument and return type can be specified with function annotations
def f1(a:list)->list:
    a.sort()
    return a

#But the above was actually not needed since when not specified,
#list of float is assumed in column formula and LabTalk
#so if what you need to make a scaler function, then
def f2(a:float, b=1)->float:
    return a+b

