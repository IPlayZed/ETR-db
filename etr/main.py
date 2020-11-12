import mysql.connector as mysql
import tkinter as tk
from tkinter import messagebox as msgbox

if __name__ == '__main__':
    root = tk.Tk()  # TKINTER TOP LEVEL WIDGET

    # GET SCREEN DIMENSIONS
    screen_width = str(root.winfo_screenwidth())
    screen_height = str(root.winfo_screenheight())

    # SET THE SCREEN DIMENSIONS
    root.geometry(screen_width + "x" + screen_height)
    # SET WINDOW NAME
    root.title("probe")

    root.mainloop()
