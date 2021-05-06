from sqlalchemy import create_engine, Column, Integer, String, Sequence
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from sqlalchemy.orm.exc import NoResultFound

Base = declarative_base()

class Server(Base):
    __tablename__ = 'servers'
    id = Column(Integer, Sequence('server_id_seq'), primary_key=True)
    server_name = Column(String)
    max_user = Column(Integer)
    address  = Column(String)
    wallet = Column(Integer)
    unit = Column(String(3))    # unit of money
    
    def __repr__(self):
        return '%s Server[max_user = %d, wallet = %d %s]'%(
            self.server_name, self.max_user, self.wallet, self.unit)

class NewServer:
    __engine = None

    def __init__(self):
        self.__engine = create_engine('sqlite:///L12DB.db', echo=False)
    def create_server(self, server):
        server = Server(server_name=server['server_name'], 
                        max_user=server['max_user'], 
                        wallet=server['wallet'], 
                        unit=server['unit'],
                        address = server['address'])
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
                "id" : s.id,
                "server_name" : s.server_name,
                "max_user" : s.max_user,
                "wallet" : s.wallet,
                "unit" : s.unit,
                "address" : s.address
            }
            list_server.append(s_json)
        session.close()
        return list_server
    def getServersById(self,server_id):
        Session = sessionmaker(bind=self.__engine)
        session = Session()
        try:
            s =  session.query(Server).filter(Server.id==server_id).one()
            s_json = {
                "id" : s.id,
                "server_name" : s.server_name,
                "max_user" : s.max_user,
                "wallet" : s.wallet,
                "unit" : s.unit ,
                "address" : s.address
            }
        except NoResultFound as e:
            return {"Dont have id" : server_id}
        finally:
            session.close()
        return s_json
    def delServersById(self, server_id):
        Session = sessionmaker(bind=self.__engine)
        session = Session()
        try: 
            tryget = session.query(Server).filter(Server.id==server_id).one()
            # session.query(Server).filter(Server.id==server_id).delete()
            session.delete(tryget)
            session.commit()
            return {
                "Deleted!" : server_id
            }
        except:
            return {
                "No Server ID" : server_id
            }
        finally: 
            session.close()
    def updateServer(self, server):
        Session = sessionmaker(bind=self.__engine)
        session = Session()
        try:
            # session.query(Server).filter(Server.id==server['id']).update({
            #     "server_name" : server['server_name'],
            #     "max_user" : server['max_user'],
            #     "wallet" : server['wallet'],
            #     "unit" : server['unit'] ,
            #     "address" : server['address']
            # })
            s = session.query(Server).filter(Server.id==server['id']).one()
            s.server_name = server['server_name']
            s.max_user = server['max_user']
            s.wallet = server['wallet']
            s.unit = server['unit']
            s.address : server['address']
            session.commit()
            return {
                "updated server id" : server['id']
            }
        except:
            return {
                "cannot update server id" : server['id']
            }
        finally:
            session.close()
