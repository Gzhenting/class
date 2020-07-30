while True:
    num = input("请输入一个三位数：")
    if int(num) < 100 or int(num) >= 1000:
        print("输入错误，请重新输入一个三位数")
    else:
        break

sum = 0
for i in num:
    sum += int(i)
print(sum)


import random
while True:
    random_num = random.randint(0, 2)
    try:
        user_num = int(input("请输入 石头[0] 剪刀[1] 布[2] :"))
    except Exception as e:
        print("输入错误，请重新输入 石头[0] 剪刀[1] 布[2] ：")
        continue

    if (random_num == 0 and user_num == 1) or \
            (random_num == 1 and user_num == 2) or\
            (random_num == 2 and user_num == 0):
        print("电脑获胜")
    elif (random_num == 0 and user_num == 2) or \
            (random_num == 1 and user_num == 0) or\
            (random_num == 2 and user_num == 1):
        print("玩家获胜")

    elif random_num == user_num:
        print("平局")

    user_choose = input("请输入[Y/N]:")
    if user_choose == 'Y' or user_choose == 'y':
        pass
    elif user_choose == 'N' or user_choose == 'n':
        break
    else:
        print("输入有误，退出游戏")
        break
print("游戏结束")
