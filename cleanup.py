import os
import sqlite3

print("Innova CleaningScript")
#Erase Chrome Browsing History
googleHistory = os.path.expanduser("~") + r"\AppData\Local\Google\Chrome\User Data\Default\History"
connect = sqlite3.connect(googleHistory)
cursor = connect.cursor()

cursor.execute("DELETE from urls")
connect.commit()
connect.close()

#Erase Firefox Browsing History
firefoxPath = os.path.expanduser("~") + r"\AppData\Roaming\Mozilla\Firefox\Profiles"
profFolder = os.listdir(firefoxPath)[0]
firefoxHistory = os.path.join(firefoxPath, profFolder, "places.sqlite")

connect = sqlite3.connect(firefoxHistory)
cursor = connect.cursor()

cursor.execute("DELETE from moz_places")

connect.commit()
connect.close()