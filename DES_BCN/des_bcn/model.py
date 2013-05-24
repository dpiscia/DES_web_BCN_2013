# -*- coding: utf-8 -*-

from sqlalchemy import create_engine
from sqlalchemy.types import Integer, String
from sqlalchemy.orm import  sessionmaker, scoped_session
from sqlalchemy import PrimaryKeyConstraint, UniqueConstraint
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import MetaData, Column
import colander
import deform

Base = declarative_base()
metadata      = Base.metadata
session       = None
tables        = {}
mappers       = {}

_salt = 'djhferuyunniurnlp097jlknf8holanhgnhhrf'

def init(url):
    """
    Initialize the tables, mapping classes and establish a session with the DB
    
    @param url: Configuration URL for the SQLAlchemy engine
    @type url: str
    """
    global session
    

        
    engine = create_engine(url, connect_args={'check_same_thread':False})
    metadata.bind = engine
    session = scoped_session(sessionmaker(bind=engine))()
    
    
    return session
    
    
def recreate():
    # Drop and recreate the database
    metadata.drop_all()
    metadata.create_all()

widget = deform.widget.CheckedInputWidget(
            subject='Email',
            confirm_subject='Confirm Email',
            size=40)
            
class User(Base):
    __tablename__ = 'user'
    __table_args__ = (
        # Primary key
        PrimaryKeyConstraint('id'),
        # Unique key
        UniqueConstraint('email'),
    )
    # Columns
    id        = Column(Integer,     nullable=False , info={'colanderalchemy': {'exclude': True}} )
    email     = Column(String(32),  nullable=False,  index=True , info={'colanderalchemy': {'validator' : colander.Email(),
                                                                                            'description' :'Type your email address and confirm it',
                                                                                             'widget' : widget  } } )
    name      = Column(String(64),  nullable=True)
    surname   = Column(String(64),  nullable=False  )

    #'password' : synonym('_password', map_column=True),     
#    @synonym_for("_password")
#    def name(self):
#        return "password: %s" % _password    

