import sqlite3
import re
import string

# open up the english db
english_conn = sqlite3.connect('english.db')
english_cur = english_conn.cursor()

# open up the espanol db
espanol_conn = sqlite3.connect('espanol.db')
espanol_cur = espanol_conn.cursor()

# open up the francais db
francais_conn = sqlite3.connect('francais.db')
francais_cur = francais_conn.cursor()

# open up the dutch db
dutch_conn = sqlite3.connect('dutch.db')
dutch_cur = dutch_conn.cursor()

#open up the persian db
persian_conn = sqlite3.connect('persian.db')
persian_cur = persian_conn.cursor()

# create the merged db
merged_conn = sqlite3.connect('merged.db')
merged_cur = merged_conn.cursor()
merged_cur.execute('CREATE TABLE prayers (id INTEGER PRIMARY KEY, category TEXT NOT NULL, prayerText TEXT NOT NULL, openingWords TEXT NOT NULL, citation TEXT NOT NULL, author TEXT NOT NULL, language TEXT NOT NULL, wordCount INTEGER NOT NULL, searchText TEXT NOT NULL)')

# harvest the data from the english dictionary
rows = english_cur.execute('SELECT * FROM prayers')
wsPattern = re.compile(" *")
for row in rows:
    prayerText = row[2]
    prayerText = string.replace(prayerText, '<p>', '')
    prayerText = string.replace(prayerText, '</p>', '')
    prayerText = string.replace(prayerText, '<p class="opening">', '')
    prayerText = string.replace(prayerText, '<span class="versal">', '')
    prayerText = string.replace(prayerText, '</span>', '')
    prayerText = string.replace(prayerText, '<p class="noindent">', '')
    prayerText = string.replace(prayerText, '<br/', '')
    prayerText = string.replace(prayerText, '<i>', '')
    prayerText = string.replace(prayerText, '</i>', '')
    prayerText = string.replace(prayerText, '<p class="comment">', '')
    prayerText = string.replace(prayerText, '<p class="commentcaps">', '')
    prayerText = string.replace(prayerText, '<em>', '')
    prayerText = string.replace(prayerText, '</em>', '')
    prayerWords = wsPattern.split(prayerText)
    rowList = list(row)
    rowList.append(len(prayerWords))
    rowList.append(prayerText)
    merged_conn.execute('INSERT INTO prayers (id, category, prayerText, openingWords, citation, author, language, wordCount, searchText) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)', rowList)

english_conn.close()

rows = espanol_cur.execute('SELECT * FROM prayers')
for row in rows:
    prayerText = row[2]
    prayerText = string.replace(prayerText, '<p>', '')
    prayerText = string.replace(prayerText, '</p>', '')
    prayerText = string.replace(prayerText, '<p class="opening">', '')
    prayerText = string.replace(prayerText, '<span class="versal">', '')
    prayerText = string.replace(prayerText, '</span>', '')
    prayerText = string.replace(prayerText, '<p class="noindent">', '')
    prayerText = string.replace(prayerText, '<br/', '')
    prayerText = string.replace(prayerText, '<i>', '')
    prayerText = string.replace(prayerText, '</i>', '')
    prayerText = string.replace(prayerText, '<p class="comment">', '')
    prayerText = string.replace(prayerText, '<p class="commentcaps">', '')
    prayerText = string.replace(prayerText, '<em>', '')
    prayerText = string.replace(prayerText, '</em>', '')
    prayerWords = wsPattern.split(prayerText)
    rowList = list(row)
    rowList.append(len(prayerWords))
    rowList.append(prayerText)
    merged_conn.execute('INSERT INTO prayers (id, category, prayerText, openingWords, citation, author, language, wordCount, searchText) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)', rowList)

espanol_conn.close()

rows = francais_cur.execute('SELECT * FROM prayers')
for row in rows:
    prayerText = row[2]
    prayerText = string.replace(prayerText, '<p>', '')
    prayerText = string.replace(prayerText, '</p>', '')
    prayerText = string.replace(prayerText, '<p class="opening">', '')
    prayerText = string.replace(prayerText, '<span class="versal">', '')
    prayerText = string.replace(prayerText, '</span>', '')
    prayerText = string.replace(prayerText, '<p class="noindent">', '')
    prayerText = string.replace(prayerText, '<br/', '')
    prayerText = string.replace(prayerText, '<i>', '')
    prayerText = string.replace(prayerText, '</i>', '')
    prayerText = string.replace(prayerText, '<p class="comment">', '')
    prayerText = string.replace(prayerText, '<p class="commentcaps">', '')
    prayerText = string.replace(prayerText, '<em>', '')
    prayerText = string.replace(prayerText, '</em>', '')
    prayerWords = wsPattern.split(prayerText)
    rowList = list(row)
    rowList.append(len(prayerWords))
    rowList.append(prayerText)
    merged_conn.execute('INSERT INTO prayers (id, category, prayerText, openingWords, citation, author, language, wordCount, searchText) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)', rowList)

francais_conn.close()
    
rows = dutch_cur.execute('SELECT * FROM prayers')
for row in rows:
    prayerText = row[2]
    prayerText = string.replace(prayerText, '<p>', '')
    prayerText = string.replace(prayerText, '</p>', '')
    prayerText = string.replace(prayerText, '<p class="opening">', '')
    prayerText = string.replace(prayerText, '<span class="versal">', '')
    prayerText = string.replace(prayerText, '</span>', '')
    prayerText = string.replace(prayerText, '<p class="noindent">', '')
    prayerText = string.replace(prayerText, '<br/', '')
    prayerText = string.replace(prayerText, '<i>', '')
    prayerText = string.replace(prayerText, '</i>', '')
    prayerText = string.replace(prayerText, '<p class="comment">', '')
    prayerText = string.replace(prayerText, '<p class="commentcaps">', '')
    prayerText = string.replace(prayerText, '<em>', '')
    prayerText = string.replace(prayerText, '</em>', '')
    prayerWords = wsPattern.split(prayerText)
    rowList = list(row)
    rowList.append(len(prayerWords))
    rowList.append(prayerText)
    merged_conn.execute('INSERT INTO prayers (id, category, prayerText, openingWords, citation, author, language, wordCount, searchText) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)', rowList)

dutch_conn.close()

rows = persian_cur.execute('SELECT * FROM prayers')
for row in rows:
    prayerText = row[2]
    prayerText = string.replace(prayerText, '<p>', '')
    prayerText = string.replace(prayerText, '</p>', '')
    prayerText = string.replace(prayerText, '<p class="opening">', '')
    prayerText = string.replace(prayerText, '<span class="versal">', '')
    prayerText = string.replace(prayerText, '</span>', '')
    prayerText = string.replace(prayerText, '<p class="noindent">', '')
    prayerText = string.replace(prayerText, '<br/', '')
    prayerText = string.replace(prayerText, '<i>', '')
    prayerText = string.replace(prayerText, '</i>', '')
    prayerText = string.replace(prayerText, '<p class="comment">', '')
    prayerText = string.replace(prayerText, '<p class="commentcaps">', '')
    prayerText = string.replace(prayerText, '<em>', '')
    prayerText = string.replace(prayerText, '</em>', '')
    prayerWords = wsPattern.split(prayerText)
    rowList = list(row)
    rowList.append(len(prayerWords))
    rowList.append(prayerText)
    merged_conn.execute('INSERT INTO prayers (id, category, prayerText, openingWords, citation, author, language, wordCount, searchText) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)', rowList)

persian_conn.close()

merged_conn.commit()
merged_conn.close()