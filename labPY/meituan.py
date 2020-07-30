import requests
from lxml import etree
import csv
import json
import random, time

header = {'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36'}
f = open("../labPy/meituan1.csv", 'a', encoding='utf-8')
writer = csv.writer(f)
# keys = ['shopId', 'shopName', 'region', 'price', 'avgPrice',
#         'star', 'commentNum', 'secondCatName', 'salesVolume', 'groupDealTitle',
#         'marketPrice', 'userComment']
# writer.writerow(keys)
page = 1

def getUserComment(shopID):
    # 开始爬取数据
    shop_url = f'https://www.meituan.com/meishi/api/poi/getMerchantComment?uuid=aimeituan-323lelhfff95e5f6dnf5f&platform=1&partner=126&originUrl=https%3A%2F%2Fwww.meituan.com%2Fmeishi%2F' \
               f'{shopID}%2F&riskLevel=1&optimusCode=10&id={shopID}&userId=&offset={random.randint(0,100)}&pageSize=10&sortType=1'
    time.sleep(random.random() * 3)
    u_response = requests.get(shop_url, headers=header)
    user_str = u_response.content.decode("utf-8")
    user_str.strip()
    # 解析数据
    user_dict = json.loads(user_str)
    u_data_dict = user_dict['data']
    tags_list = u_data_dict['tags']
    userComment = ''
    if tags_list:
        if len(tags_list) > 0:
            for dic in tags_list:
                userComment += str(dic['count']) + dic['tag'] + '-'
    return userComment


while page <= 250:
    url = f"https://imt.meituan.com/api/list/group?mtCityId=40&dpCityId=9&mtFECat0=1&mtFECat1=&mtFECat2=-1&districtId=&regionId=&pageId=request-15mlfe0i4405e5f6f1d83&cityPrefix=cq&originCityID=0&realLocationID=500000&utmSource=2345&utmMedium=&slotId=38006&pageStart={page}"
    s = '开始下载第{}页'.format(page)
    print(s)

    # 开始爬取数据
    time.sleep(random.random() * 3)
    response = requests.get(url, headers=header)
    data_str = response.content.decode("utf-8")
    data_str.strip()
    # 解析数据
    data_dict = json.loads(data_str)
    data_list = data_dict['data']

    for dic in data_list:
        # 数据字符串优化
        for key in dic.keys():
            if dic[key] is str:
                dic[key].replace('0xb2', '')
        # 写入数据
        # print([dic['shopId'], dic['shopName'], dic['region'], dic['price'], dic['avgPrice'],
        #                  dic['star'], dic['commentNum'], dic['secondCatName'], dic['salesVolume'], dic['groupDealTitle'],
        #                  dic['marketPrice'], dic['clickURL']])
        shopID = dic['shopId']
        userComment = getUserComment(shopID)
        writer.writerow([dic['shopId'], dic['shopName'], dic['region'], dic['price'], dic['avgPrice'],
                         dic['star'], dic['commentNum'], dic['secondCatName'], dic['salesVolume'], dic['groupDealTitle'],
                         dic['marketPrice'], userComment])

    page += 1

f.close()

