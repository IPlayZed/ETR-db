import mysql.connector as mysql
import tkinter as tk
from tkinter import messagebox as msgbox

if __name__ == '__main__':
    root = tk.Tk()  # TKINTER_STARTER_OBJECT_FOR_GUI

    screen_width = str(root.winfo_screenwidth())
    screen_height = str(root.winfo_screenheight())

    root.geometry(screen_width+"x"+screen_height)
    root.title("probe")

    root.mainloop()