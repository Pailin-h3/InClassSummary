
from sqlalchemy import create_engine, Column, Integer, String, Sequence
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

Base = declarative_base()

class Server(Base):
    __tablename__ = 'servers'
    id = Column(Integer, Sequence('server_id_seq'), primary_key=True)
    server_name = Column(String)
    max_user = Column(Integer)
    wallet = Column(Integer)
    unit = Column(String(3))    # unit of money
    
    def __repr__(self):
        return '%s Server[max_user = %d, wallet = %d %s]'%(
            self.server_name, self.max_user, self.wallet, self.unit)

class NewServer:
    __engine = None

    def __init__(self):
        self.__engine = create_engine('sqlite:///iProject.db', echo=False)
    def create_server(self, server):
        server = Server(server_name=server['server_name'], 
                        max_user=server['max_user'], 
                        wallet=server['wallet'], 
                        unit=server['unit'])
        Base.metadata.create_all(self.__engine)
        Session = sessionmaker(bind=self.__engine)
        session = Session()
        session.add(server)
        session.commit()
        session.close()
    def getServers(self):
        Session = sessionmaker(bind=self.__engine)
        session = Session()
        all_server =  session.query(Server).all()
        list_server = []
        for s in all_server:
            s_json = {
                "server_name" : s.server_name,
                "max_user" : s.max_user,
                "wallet" : s.wallet,
                "unit" : s.unit 
            }
            list_server.append(s_json)

        session.close()
        return list_server

