import matplotlib.pyplot as plt
from influxdb import InfluxDBClient
import array as arr
from datetime import datetime
import pandas as pd
import sys
sys.path.insert(0, '../../')
from query_data_functions import *


def main(host='5.189.144.254', port=8086):
    """Instantiate a connection to the InfluxDB."""
    user = 'admin'
    password = 'os234guivahdf1a'
    dbname = 'remoteInstance'
    client = InfluxDBClient(host, port, user, password, dbname)

    # Get Requests from InfluxDB
    requests10 = getRequestsDf(client, "1s")

    # Request duraition
    yresult = requests10["requests_duration_percentile_95"]
    xresult = requests10.index.tolist()
    # Amount of requests
    # xresult = requests10["vus"]

    # Transformation of arrays
    # yresult = removeNan(yresult)
    # xresult = calcSumFromRow(xresult)

    plt.figure(num='Request duration of 95% of the requests', figsize=(14, 10), dpi=100, facecolor='w', edgecolor='k')
    plt.plot(xresult, yresult, label = "Request duration of 95% of the requests", color = "red",linewidth=7.0)

    plt.gcf().autofmt_xdate()

    # Naming the x axis
    plt.xlabel('Amount of requests sent')
    # naming the y axis
    plt.ylabel('Duration in milliseconds')
    # give a title
    plt.title('Request duration of 95% of the requests')
    # show legend on plot
    plt.legend()
    # save as image
    plt.savefig('./gen_images/request_duration.png')

    # Error Graph
    try:
        yresult = requests10["vus"]
        # Amount of requests
        xresult = requests10.index.tolist()
        # xresult, yresult = remove0Values(xresult, yresult)
    except:
        xresult = []
        yresult = []

    plt.figure(num='Amount of failed requests', figsize=(14, 10), dpi=100, facecolor='w', edgecolor='k')
    plt.plot(xresult, yresult, label = "Amount of failed requests", color = "red",linewidth=7.0)

    plt.gcf().autofmt_xdate()

    # Naming the x axis
    plt.xlabel('Timestamps')
    # naming the y axis
    plt.ylabel('Amount of failed reqeuests')
    # give a title
    plt.title('Amount of failed requests')
    # show legend on plot
    plt.legend()
    # save as image
    plt.savefig('./gen_images/request_duration_failed.png')

    # function to show the plot
    plt.show()


if __name__ == '__main__':
    main(host='5.189.144.254', port='8086')

