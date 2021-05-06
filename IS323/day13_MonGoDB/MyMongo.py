from mongoengine import connect, disconnect
from mongoengine import DynamicDocument, StringField, IntField

class Server(DynamicDocument):
    meta = {'db_alias' : 'is323'}

    server_name = StringField(max_length=50, required=True)
    max_user = IntField()
    address  = StringField(max_length=200)
    wallet = IntField()
    unit = StringField(max_length=3)
    
    def __repr__(self):
        return '%s Server[max_user = %d, wallet = %d %s]'%(
            self.server_name, self.max_user, self.wallet, self.unit)

class NewServer:
    def __init__(self):
        connect(
            alias = 'is323',
            host = 'mongodb+srv://Pailin-h3:JXGPhggdkDQdyYzI@cluster0.c4pbi.mongodb.net/is323?retryWrites=true&w=majority'
        )
    def create_server(self, server):
        server = Server(server_name=server['server_name'], 
                        max_user=server['max_user'], 
                        wallet=server['wallet'], 
                        unit=server['unit'],
                        address = server['address'])
        server.save()
        disconnect()
    def getServers(self):
        list_server = []
        for s in Server.objects:
            s_json = {
                "id" : str(s.pk),
                "server_name" : s.server_name,
                "max_user" : s.max_user,
                "wallet" : s.wallet,
                "unit" : s.unit,
                "address" : s.address
            }
            list_server.append(s_json)
        disconnect()
        return list_server
    def getServersById(self,server_id):
        try:
            s = Server.objects(pk=server_id).first()
            s_json = {
                "id" : str(s.pk),
                "server_name" : s.server_name,
                "max_user" : s.max_user,
                "wallet" : s.wallet,
                "unit" : s.unit ,
                "address" : s.address
            }
            return s_json
        except:
            return {"Dont have id" : server_id}
        finally:
            disconnect()
        
    def delServersById(self, server_id):
        try: 
            s = Server.objects(pk=server_id).first()
            s.delete()
            return {
                "Deleted!" : server_id
            }
        except:
            return {
                "No Server ID" : server_id
            }
        finally:
            disconnect()
    def updateServer(self, server):
        try:
            s = Server.objects(pk=server['id']).first()
            s.server_name = server['server_name']
            s.max_user = server['max_user']
            s.wallet = server['wallet']
            s.unit = server['unit']
            s.address : server['address']
            s.save()
            return {
                "updated server id" : server['id']
            }
        except:
            return {
                "cannot update server id" : server['id']
            }
        finally:
            disconnect()






