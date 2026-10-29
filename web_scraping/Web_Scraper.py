from bs4 import BeautifulSoup
import requests
import pandas as pd

url = 'https://webscraper.io/test-sites/pagination'

page = requests.get(url)

soup = BeautifulSoup(page.text, 'html')

info = soup.find('p', class_='description')

df = pd.DataFrame(columns=info)