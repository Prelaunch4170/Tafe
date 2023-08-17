import os
from twilio.rest import Client

import CallApi

# Find your Account SID and Auth Token at twilio.com/console
# and set the environment variables. See http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']

fuel_dict = {2: "Unleaded", 3: "Diesel", 4: "LPG", 5: "Premium Unleaded 95", 6: "ULSD", 8: "Premium Unleaded 98",
             11: "LRP", 12: "e10", 13: "Premium e5", 14: "Premium Diesel", 16: "Bio-Diesel 20", 19: "e85", 21: "OPAL",
             22: "Compressed natural gas", 23: "Liquefied natural gas", 999: "e10/Unleaded",
             1000: "Diesel/Premium Diesel"}

client = Client(account_sid, auth_token)
apiMessage = CallApi.Call_api()

message = client.messages \
    .create(
    body=apiMessage,
    from_='+17068073673',
    to='+61410531436'
)

print(apiMessage)
print(message.sid)
