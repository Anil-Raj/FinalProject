import random
import string
import os
import cherrypy


class StringGenerator(object):
    @cherrypy.expose
    def index(self):
        return """<html>
          <head></head>
          <body>
            <form action="executing" method=POST>
  		<input type="file" name=myFile >
  		<input type=submit >
	    </form>
	    <form action="daychart" method=POST>
  		<input type=submit value="DAY" >
	    </form>
	    <form action="daybar" method=POST>
  		<input type=submit value="daybar">
	    </form>
	    <form action="ipchart" method=POST>
  		<input type=submit value="IP" >
	    </form>
	   <form action="ipbar" method=POST>
  		<input type=submit value="IPbar" >
	    </form>
	    <form action="brchart" method=POST>
  		<input type=submit value="browser" >
	    
          </body>
        </html>"""
    @cherrypy.expose
    def executing( self, myFile=None ):
	ff = os.path.join(os.path.dirname(myFile),myFile)
        os.system("sh script.sh "+myFile) 
	return """<html>
          <head></head>
          <body>
            <form action="daychart" method=POST>
  		<input type=submit value="daychart">
	    <form action="daybar" method=POST>
  		<input type=submit value="daybar">
	    </form>
	    <form action="ipchart" method=POST>
  		<input type=submit value="ipchart">
	    </form>
            <form action="ipbar" method=POST>
  		<input type=submit value="IPbar" >
	    </form>
	    
          </body>
        </html>"""

    @cherrypy.expose
    def daychart( self): 
	return file("day.html")
    
    @cherrypy.expose
    def ipchart( self): 
	return file("ip.html")
  
    @cherrypy.expose
    def brchart( self): 
	return file("browser.html")
  
    @cherrypy.expose
    def daybar( self): 
	return file("daybar.html")

    @cherrypy.expose
    def ipbar( self): 
	return file("ipbar.html")

    
tutconf = os.path.join(os.path.dirname(__file__), 'tutorial.conf')

    

if __name__ == '__main__':
    config = {
        '/':{
            'tools.staticdir.on': True,
            'tools.staticdir.dir': os.path.abspath(os.getcwd())
        },
        '/static':{
            'tools.staticdir.on': True,
            'tools.staticdir.dir': os.path.join(os.getcwd(),'static')
        }            
    }
    cherrypy.quickstart(StringGenerator(),config=tutconf)

