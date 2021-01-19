import requests
from bs4 import BeautifulSoup
import sys


class color:
    PURPLE = '\033[95m'
    CYAN = '\033[96m'
    DARKCYAN = '\033[36m'
    BLUE = '\033[94m'
    GREEN = '\033[92m'
    YELLOW = '\033[93m'
    RED = '\033[91m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'
    END = '\033[0m'


URL = 'https://www.dituniversity.edu.in/'
target = 'happenings/important-notices'


def help():
    print("\nUsage: notice [option] [display options]"
          "\n"
          "\nOPTIONS:"
          "\n\t-n\tDisplays first 3 entries"
          "\n\t-a\tDisplays all entries in page 1"
          "\n"
          )


def scrape(x):
    try:
        page = requests.get(URL+target)
    except:
        print('\n'+color.BOLD+color.RED+'CONNECTION ERROR'+color.END+'\n')
        sys.exit()

    soup = BeautifulSoup(page.content, 'html.parser')
    container = soup.find(id='blog-landing')
    items = container.find_all('li')

    if x == -1:
        x = len(items)

    BBOLD = color.BOLD+color.BLUE
    print('\n'+BBOLD+'PAGE LINK: '+color.END+URL+target)
    print(color.RED+'-'*60+color.END+'\n')
    for i in range(0, x):
        date = items[i].find('h4').text.strip()
        desc = items[i].find('h3').text.strip()
        link = items[i].find('a')['href'].strip()

        print(BBOLD+'DATE: '+color.END+color.CYAN+date+'\n' +
              BBOLD+'DESC: '+color.END+color.YELLOW+desc+'\n' +
              BBOLD+'LINK: '+color.END+URL+link,
              end='\n\n'+color.RED+'-'*60+color.END+'\n\n')


if __name__ == '__main__':
    arg = sys.argv[1:]
    if len(arg) == 0:
        help()
    elif '-n' in arg:
        scrape(3)
    elif '-a' in arg:
        scrape(-1)
    else:
        help()
