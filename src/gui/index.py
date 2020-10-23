from PyQt5.QtWidgets import *
from PyQt5 import QtGui, QtCore
import sys
from GuiElements import *


if __name__ == '__main__':
    app = QApplication(sys.argv)
    main_window = MainWindow()
    sys.exit(app.exec_())
