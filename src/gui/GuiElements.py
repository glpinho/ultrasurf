from PyQt5.QtWidgets import *
from PyQt5 import QtGui, QtCore
import sys


class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.init_window()
        self.show()

    def init_window(self):
        self.setWindowIcon(QtGui.QIcon('icon.png'))
        self.setWindowTitle('UltraSurf')
        self.setGeometry(200, 100, 800, 600)
        self.table_widget = TableWidget()
        self.setCentralWidget(self.table_widget)


class TableWidget(QWidget):
    def __init__(self):
        super().__init__()
        self.layout = QVBoxLayout(self)
        self.tabs = QTabWidget()
        self.discreteTab = DiscreteAnalysisTab()
        self.continuumTab = ContinuumAnalysisTab()
        self.interfaceTab = InterfaceAnalysisTab()
        self.tabs.addTab(self.discreteTab, self.discreteTab.title)
        self.tabs.addTab(self.continuumTab, self.continuumTab.title)
        self.tabs.addTab(self.interfaceTab, self.interfaceTab.title)

        self.layout.addWidget(self.tabs)
        self.setLayout(self.layout)


class DiscreteAnalysisTab(QWidget):
    def __init__(self):
        super().__init__()
        self.title = "Discrete Analysis"


class ContinuumAnalysisTab(QWidget):
    def __init__(self):
        super().__init__()
        self.title = "Continuum Analysis"


class InterfaceAnalysisTab(QWidget):
    def __init__(self):
        super().__init__()
        self.title = "Interface Analysis"
