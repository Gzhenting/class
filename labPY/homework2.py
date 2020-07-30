#冒泡排序法
# k = []
# for i in range(5):
#     user_input = input("请输入第%d个数:" % (i+1))
#     k.append(int(user_input))
#
# for i in range(len(k)-1):
#     for j in range(len(k)-1-i):
#         if k[j] > k[j+1]:
#             min = k[j+1]
#             k[j+1] = k[j]
#             k[j] = min
# print(k)
#
# k=[1, 2, 3]
# print(k[::-1])


# def charge(str):
#     for i in range(int(len(str)/2)):
#         if str[i] == str[len(str)-1-i]:
#             return True
#         else:
#             return False
# 判断是否是回文字符串
# str = input("输入一个字符串：")
# if charge(str):
#     print("%s 是回文字符串" % (str))
# else:
#     print("%s 不是回文字符串" % (str))
#
# def fun(str):
#     if str == str[::-1]:
#         return True
#     else:
#         return False

# 输入一个字符串统计字符的个数并存入字典
# str = input("输入一个字符串：")
# count = {}
# for i in str:
#     count[i] = str.count(i)
# print(count)

# for i in str:
#     if i not in count:
#         count[i] = 1
#     else:
#         count[i] += 1
#


my_str = '112233'
# temp = ''
# 删去字符串中重复的字母
# for i in str:
#     if (i not in temp):
#         temp += i
# print(temp)
# 统计字符串中重复字符的个数
# for i in my_str:
#     if (i not in temp):
#         num = my_str.count(i)
#         if num != 1:
#             temp += str(num)
#             temp += i
# print(temp)
# temp ={}
# for i in my_str:
#     if i not in temp:
#         temp[i] = my_str.count(i)
# temp_str = ''
# for k, v in temp.items():
#     temp_str = temp_str + str(v) + k
# print(temp_str)
f1 = open("C:\\Users\\24058\\Desktop\\c.txt",'r')
content = f1.read()
f2 = open("D:\d.txt", 'w')
f2.write(content)
f1.close()
f2.close()



