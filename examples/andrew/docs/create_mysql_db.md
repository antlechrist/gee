HOWTO CREATE A MYSQL DATABASE
=============================

    [root@griffin ~]# mysql -u root -p
    Enter password:
    
    mysql> CREATE DATABASE world_domination;

    mysql> GRANT ALL PRIVILEGES ON world_domination.* to "stewie"@"localhost"
    IDENTIFIED BY "blast-you-vile-woman";
    
    mysql> FLUSH PRIVILEGES;
    
    mysql> EXIT;

Disclaimer: I'm not a big fan of databases.
