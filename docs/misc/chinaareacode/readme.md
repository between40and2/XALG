# Crawling China Area(Division) Code.

## Background Knowledge

### Administration

Level|Alias|Head职务|军队
--|--|--|--
省级 |市，省，自治区|省部级|军长
地级 |市，自治州，盟，地区|司局级|师长
县级 |县，区，自治县，旗|县处级|
乡级 |乡，镇，街道
村级 |村，社区

* [百度百科：中国干部级别](https://baike.baidu.com/item/中国干部级别)

### Data, from official set

Defined by National Bureau of Statistics of PRC (国家统计局) as a [Standard (统计标准)](http://www.stats.gov.cn/tjsj/tjbz/)

* [行政区划代码](http://www.stats.gov.cn/tjsj/tjbz/xzqhdm/)
* [统计用区划和城乡划分代码](http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/) | [2016](http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2016/index.html)

## Data Details

### [Province list](http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2016/index.html)


### [Per-Province] and drill down

Level | Code | Name (Link) | Core Part
--|--|--|--
省级|11| [北京市](http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2016/11.html)  | 11.html
地级|1101|[市辖区](http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2016/11/1101.html) | 11/1101.html
县级|110101|[东城区](http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2016/11/01/110101.html) | 11/01/110101.html
乡级| 110101002| [景山街道办事处](http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2016/11/01/01/110101002.html) | 11/01/01/110101002.html
村级| 110101002009| 皇城根北街社区居委会

## Program

* given a string as province code.
* compose its URL and
* grab the page, save it in html file. and encode into UTF-8
* parse html, get tabular data, and write in txt file.
* for each subordinate, if link is provided, repeat the procedure.

### Basic skills - for every language

String

IO
