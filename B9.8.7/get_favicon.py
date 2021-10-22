from bs4 import BeautifulSoup
import requests
import sys, getopt

def getFavicon(domain):
    if 'http' not in domain:
        domain = 'http://' + domain
    page = requests.get(domain)
    soup = BeautifulSoup(page.text, features="lxml")
    icon_link = soup.find("link", rel="shortcut icon")
    if icon_link is None:
        icon_link = soup.find("link", rel="icon")
    if icon_link is None:
        return domain + '/favicon.ico'
    return icon_link["href"]

def main(argv):
   try:
      opts, args = getopt.getopt(argv,"hu:")
   except getopt.GetoptError:
      print('get_favicon.py -u google.com')
      sys.exit(2)
   for opt, arg in opts:
      if opt == '-h':
         print('Usage: get_favicon.py -u google.com')
         sys.exit()
      elif opt in ("-u"):
         print(getFavicon(arg))

if __name__ == "__main__":
   main(sys.argv[1:])