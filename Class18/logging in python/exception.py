def division(a,b):
    try:
        out = a/b
        return out
    except Exception as e:
        print("There are some problem with division",e)

out = division(4,0)
print(out)