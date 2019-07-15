import matplotlib.pyplot as plt
from influxdb import InfluxDBClient
import array as arr
from datetime import datetime
import pandas as pd
import sys
sys.path.insert(0, '../../Evaluation-Module')
from query_data_functions import *


def main(host='5.189.144.254', port=8086):
    """Instantiate a connection to the InfluxDB."""
    user = 'admin'
    password = 'os234guivahdf1a'
    dbname = 'remoteInstance'
    client = InfluxDBClient(host, port, user, password, dbname)

    # Get Requests from InfluxDB
    requests10 = getRequestsDf(client, "10s")

    # Request duraition
    yresultunprio = requests10["requests_duration_percentile_95"]
    # Amount of requests
    xresultunprio = requests10["requests"]

    # Transformation of arrays
    yresultunprio = removeNan(yresultunprio)
    xresultunprio = calcSumFromRow(xresultunprio)

    """Instantiate a connection to the InfluxDB."""
    user = 'admin'
    password = 'os234guivahdf1a'
    dbname = 'remoteInstanceprio'
    client = InfluxDBClient(host, port, user, password, dbname)

    # Get Requests from InfluxDB
    requests10 = getRequestsDf(client, "10s")

    # Request duraition
    yresultprio = requests10["requests_duration_percentile_95"]
    # Amount of requests
    xresultprio = requests10["requests"]

    # Transformation of arrays
    yresultprio = removeNan(yresultprio)
    xresultprio = calcSumFromRow(xresultprio)

    plt.figure(num='Request duration of 95% of the requests of unprioritized and prioritized Web benchmark', figsize=(14, 10), dpi=100, facecolor='w', edgecolor='k')
    plt.plot(xresultunprio, yresultunprio, label = "Unprioritized benchmark", color = "blue",linewidth=5.0)
    plt.plot(xresultprio, yresultprio, label = "Prioritized benchmark", color = "red",linewidth=5.0)

    plt.gcf().autofmt_xdate()

    # Naming the x axis
    plt.xlabel('Amount of requests sent')
    # naming the y axis
    plt.ylabel('Duration in milliseconds')
    # give a title
    plt.title('Request duration of 95% of the requests of unprioritized and prioritized Web benchmark')
    # show legend on plot
    plt.legend()
    # save as image
    plt.savefig('./gen_images/comparison_request_duration.png')


    # function to show the plot
    plt.show()


if __name__ == '__main__':
    main(host='5.189.144.254', port='8086')

