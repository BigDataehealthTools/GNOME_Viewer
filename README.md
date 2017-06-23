![alt text](https://github.com/BigDataehealthTools/GNOME_Viewer/blob/master/GNOME_Viewer/public/img/GenomeViewer_logo.png)
# What you need to run the project #

1. Have Python 2.7.8 (or higher) installed
2. Have [Pip installed](https://pip.pypa.io/en/stable/installing/)
3. Have [Virtualenv installed](https://packaging.python.org/key_projects/#virtualenv)

# How to run the project #

1. Clone repository
2. Move into the GNOME Viewer folder
3. Create a virtual environnement using Virtualenv
4. Install needed libraries using this command :

    pip install -r /path/to/requirements.txt

5. Set a MySQL database and load the marqueurs.sql table located in the project's root (it's a truncated dataset). 
   
   To have a complete dataset, contact beatriz.kanzki@gmail.com 
   
   Also make sure MySQL is running!

6. Connect project to database (in the settings.py file)
7. Migrate database (not really necessary since we loaded the sql files, but we never know...)

    python manage.py migrate

8. Create a new superuser using this command :
    
    python manage.py createsuperuser
    
9. Run the command (and keep it running!) :

    python manage.py runserver

9. You should be good to go! The address should be http://localhost:8000

# What you need to work on the project #

1. (Same as above)
2. [Install Node.js and npm](https://docs.npmjs.com/getting-started/installing-node) (3.10.10 working)


# How to work on the project #

1. Do the same steps as above.
2. Move into /GNOME_Viewer/front_end
3. Run this command. It will install all the dependencies in the 'package.json' file.

    npm install
    
    npm install react-image --save
    
4. Run this command. It will launch a watcher, which will update the file 'main.js' which is where all the front_end code is compressed into for the browser.

    npm start
    
5. Note : you will need to have both commands running!
    - python manage.py runserver
    - npm start

6. You should be good to go!
