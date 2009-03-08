import sqlite3

# open up the english db
english_conn = sqlite3.connect('pbdb_converted.db')
english_cur = english_conn.cursor()

# open up the espanol db
espanol_conn = sqlite3.connect('espanol_converted.db')
espanol_cur = espanol_conn.cursor()

# create the merged db
merged_conn = sqlite3.connect('merged_db.db')
merged_cur = merged_conn.cursor()
merged_cur.execute('CREATE TABLE prayers (id INTEGER PRIMARY KEY, category TEXT NOT NULL, prayerText TEXT NOT NULL, openingWords TEXT NOT NULL, citation TEXT NOT NULL, author TEXT NOT NULL, language TEXT NOT NULL, wordCount INTEGER NOT NULL, searchText TEXT NOT NULL)')

# harvest the data from the english dictionary
rows = english_cur.execute('SELECT * FROM prayers')
for row in rows:
    merged_conn.execute('INSERT INTO prayers (id, category, prayerText, openingWords, citation, author, language, wordCount, searchText) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)', row)

# harvest the data from the spanish dictionary
rows = espanol_cur.execute('SELECT * FROM prayers')
for row in rows:
    merged_conn.execute('INSERT INTO prayers (id, category, prayerText, openingWords, citation, author, language, wordCount, searchText) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)', row)
    
merged_cur.commit()
merged_conn.close()