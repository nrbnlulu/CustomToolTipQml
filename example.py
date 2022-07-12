import sys
from os.path import abspath, dirname, join
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine



if __name__ == '__main__':
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    qmlFile = join(dirname(__file__), 'example.qml')
    engine.load(abspath(qmlFile))
        
    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec_())