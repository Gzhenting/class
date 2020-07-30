import json, os

print('*'*20 + '欢迎使用图书管理系统' + '*'*20)
# 创建列表，员工信息以字符串形式存储
# book_list = []
# book_file = open("C:\\Users\\24058\\Desktop\\book.txt", 'r+')
# book_str = book_file.read()
# print(book_str)
# book_list = json.loads(book_str, strict=False)
# while True:
#     print('请选择操作')
#     print('\t1.添加图书')
#     print('\t2.根据书名查找图书')
#     print('\t3.根据图书编号删除图书')
#     print('\t4.显示所有图书信息')
#     print('\t5.退出系统')
#     user_choose = input('输入不同数字，使用不同功能：')
#     print('*' * 64)
# # 添加图书
#     if user_choose == '1':
#         book_num=input('请输入图书编号:')
#         book_name=input('请输入图书书名:')
#         book_price=input('请输入图书价格:')
#         #显示一个提示信息
#         book_temp = {}
#         book_temp['编号'] = book_num
#         book_temp['书名'] = book_name
#         book_temp['价格'] = book_price
#         print('以下图书将会被添加到系统中')
#         print(book_temp)
#         user_confirm = input('是否确认该操作[Y/N]:')
#         if user_confirm == 'Y' or user_confirm == 'y':
#             book_list.append(book_temp)
#             print('添加成功')
#         elif user_confirm == 'N' or user_confirm == 'n':
#             print('取消添加')
#
#     elif user_choose == '2':
#         check_name = input("请输入书名:")
#         charge = 0
#         for dic in book_list:
#             if check_name == dic['书名']:
#                 print(dic)
#                 charge = 1
#                 break
#         if not charge:
#             print("查找图书不存在")
#
#     elif user_choose == '3':
#         # 根据图书编删除图书
#         del_num = input('请输入要删除图书编号')
#         # 判断序号是否有效
#         charge = 0
#         for dic in book_list:
#             if del_num == dic['编号']:
#                 print('以下图书将会被删除')
#                 print(dic)
#                 charge = 1
#                 break
#
#         if charge:
#             user_confirm = input('是否确认该操作[Y/N]:')
#             if user_confirm == 'Y' or user_confirm == 'y':
#                 book_list.remove(dic)
#                 print('删除成功')
#             elif user_confirm == 'N' or user_confirm == 'n':
#                 print('操作取消')
#             else:
#                 print('您的输入有误，请重新输入')
#         else:
#             print("图书不存在")
#
#     elif user_choose == '4':
#         for book in book_list:
#             print(book)
#
#     elif user_choose == '5':
#         book_str = json.dumps(book_list)
#         book_file.write(book_str)
#         book_file.close()
#         print('本次服务结束!下次再见！')
#         input('点击回车退出：')
#         break
#     else:
#         print('输入有误，请重新选择！')
#
#     print('='*64)
# 加载图书
SAVE_PATH = "C:\\Users\\Desktop\\bookclass.txt"
def loadBooks():
    # 判断文件是否存在
    if not os.path.exists(SAVE_PATH):
        return []
    else:
        f = open(SAVE_PATH, 'r')
        contents = f.read()
        f.close()
        if len(contents) == 0:
            return []
        else:
            return json.loads(contents)

def saveBooks():
    f = open(SAVE_PATH, 'w')
    content = json.dumps(books)
    f.write(content)
    f.close()

books = loadBooks()

def addBook():
    book_num = input('请输入图书编号:')
    book_name = input('请输入图书书名:')
    book_price = input('请输入图书价格:')
    #显示一个提示信息
    book_temp = {'编号': book_num, '书名': book_name, '价格': book_price}
    books.append(book_temp)
    saveBooks()

def findBookByName():
    pass
def delBookById():
    pass
def showBook():
    for book in books:
        print(f"编号：{book['编号']}  书名：{book['书名']}  价格：{book['价格']}")
while True:
    print('请选择操作')
    print('\t1.添加图书')
    print('\t2.根据书名查找图书')
    print('\t3.根据图书编号删除图书')
    print('\t4.显示所有图书信息')
    print('\t5.退出系统')
    user_choose = input('输入不同数字，使用不同功能：')
    if user_choose == '1':
        addBook()
    elif user_choose == '2':
        findBookByName()
    elif user_choose == '3':
        delBookById()
    elif user_choose == '4':
        showBook()
    else:
        exit()