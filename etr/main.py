import tkinter

___DEBUG_MODE___ = True

from etr.etr_gui.gui import gui_home_window

if __name__ == '__main__':
    # a = debug_mysql_query_insert_into('oktato', ['alma', 'répa'], ['oszl1', 'oszl2'])
    root_widget = tkinter.Tk()
    scr_w = str(root_widget.winfo_screenwidth() // 2)
    scr_h = str(root_widget.winfo_screenheight() // 2)
    root_widget.geometry(scr_w + 'x' + scr_h)
    root_widget.attributes('-fullscreen', 0)
    # TODO: find out why iconbitmap() does not work!!!
    # root_widget.iconbitmap('icon.ico')
    gui_home_window(root=root_widget)
    root_widget.mainloop()
    root_widget.destroy()
