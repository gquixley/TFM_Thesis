import numpy as np           # numerical programming

# Define Road Characteristics
# Each road must have:
#   length - road segment length (in km)
#   vmax   - max speed (in km/h)
#   dmax   - max density (in veh/km)
#   source - binary selection if source(1)/not(0)
#   sink   - binary selection if sink(1)/not(0)
#   demand - demand function of density
#   supply - supply function of density
#
# If a road is a source or sink:
#   change source(1)/sink(1) to the function
#   demand_upstream (source) or supply_downstream (sink)
#   a function of time and returns a flow (in veh/hr)
#
# Define a new road by network[road] with road = 1, 2, 3, ..., n
# the network object is a nested dictionary
# network = {road_1: {'length_1': ___, 'vmax_1': ___, 'source_1': ___, 'sink_1': ___, 'demand_1': ___, 'supply_1': ___},
#             ...
#            road_n: {'length_n': ___, 'vmax_n': ___, 'source_n': ___, 'sink_n': ___, 'demand_n': ___, 'supply_n': ___}
#           }

network = {}

# Road Template
# network[1] = {'length': 5 km, 'vmax': 90 km/h, 'dmax': 30 veh/km, 'source': 1, 'sink': 1}
# def demand(rho): return (90*rho)*(rho <= 30) + 2700*(rho > 30)
# def supply(rho): return 2700*(rho <= 30) + (15*(30-rho)+2700)*(rho > 30)
# network[1]['demand'] = demand
# network[1]['supply'] = supply
# def demand_upstream(): return 0
# network[1]['source'] = demand_upstream
# def supply_downstream(): return 10000000000000
# network[1]['sink'] = supply_downstream

# Demand and Supply - density relations

#def demand(rho): return (48*rho)*(rho <= 50) + (48*50)*(rho > 50)
#def supply(rho): return (48*50)*(rho <= 50) + ((50/2)*(50-rho)+(48*50))*(rho > 50)

def demand(rho): return (48*rho)*(rho <= 16) + (48*16)*(rho > 16)
def supply(rho): return (48*16)*(rho <= 16) + ((16/4)*(16-rho)+(48*16))*(rho > 16)

# Sink condition
def supply_downstream(t): return 1e12

#  def supply_downstream_MH(t): return 1e12

# Main Road SOURCE/SINKS

network[1] = {'length': 0.1, 'vmax': 48, 'dmax': 208, 'source': 1, 'sink': 0}
network[1]['demand'] = demand
network[1]['supply'] = supply
def demand_upstream(t): return 0.2  # Marlow hill road
network[1]['source'] = demand_upstream

network[2] = {'length': 0.1, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 1}
network[2]['demand'] = demand
network[2]['supply'] = supply
network[2]['sink'] = supply_downstream

network[3] = {'length': 0.1, 'vmax': 48, 'dmax': 208, 'source': 1, 'sink': 0}
network[3]['demand'] = demand
network[3]['supply'] = supply
def demand_upstream(t): return 0.2  # Road from hospital/university
network[3]['source'] = demand_upstream

network[4] = {'length': 0.1, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 1}
network[4]['demand'] = demand
network[4]['supply'] = supply
network[4]['sink'] = supply_downstream

network[5] = {'length': 0.1, 'vmax': 48, 'dmax': 208, 'source': 1, 'sink': 0}
network[5]['demand'] = demand
network[5]['supply'] = supply
def demand_upstream(t): return 0.2  # Road from Shopping center
network[5]['source'] = demand_upstream

network[6] = {'length': 0.1, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 1}
network[6]['demand'] = demand
network[6]['supply'] = supply
network[6]['sink'] = supply_downstream

network[7] = {'length': 0.1, 'vmax': 48, 'dmax': 208, 'source': 1, 'sink': 0}
network[7]['demand'] = demand
network[7]['supply'] = supply
def demand_upstream(t): return 0.2  # Road from RGS
network[7]['source'] = demand_upstream

network[8] = {'length': 0.1, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 1}
network[8]['demand'] = demand
network[8]['supply'] = supply
network[8]['sink'] = supply_downstream

network[9] = {'length': 0.1, 'vmax': 48, 'dmax': 208, 'source': 1, 'sink': 0}
network[9]['demand'] = demand
network[9]['supply'] = supply
def demand_upstream(t): return 0.2  # Road from park
network[9]['source'] = demand_upstream

network[10] = {'length': 0.1, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 1}
network[10]['demand'] = demand
network[10]['supply'] = supply
network[10]['sink'] = supply_downstream

network[51] = {'length': 0.05, 'vmax': 48, 'dmax': 208, 'source': 1, 'sink': 0}
network[51]['demand'] = demand
network[51]['supply'] = supply
def demand_upstream(t): return 0.05  # Exit road from Theatre
network[51]['source'] = demand_upstream

# Major inner roundabout

network[11] = {'length': 0.03, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[11]['demand'] = demand
network[11]['supply'] = supply

network[12] = {'length': 0.03, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[12]['demand'] = demand
network[12]['supply'] = supply

network[13] = {'length': 0.03, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[13]['demand'] = demand
network[13]['supply'] = supply

network[14] = {'length': 0.03, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[14]['demand'] = demand
network[14]['supply'] = supply

network[15] = {'length': 0.03, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[15]['demand'] = demand
network[15]['supply'] = supply

network[16] = {'length': 0.07, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[16]['demand'] = demand
network[16]['supply'] = supply

network[17] = {'length': 0.03, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[17]['demand'] = demand
network[17]['supply'] = supply

network[18] = {'length': 0.03, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[18]['demand'] = demand
network[18]['supply'] = supply

network[19] = {'length': 0.1, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[19]['demand'] = demand
network[19]['supply'] = supply

network[20] = {'length': 0.1, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[20]['demand'] = demand
network[20]['supply'] = supply

# Small Roundabouts

network[21] = {'length': 0.03, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[21]['demand'] = demand
network[21]['supply'] = supply

network[22] = {'length': 0.03, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[22]['demand'] = demand
network[22]['supply'] = supply

network[23] = {'length': 0.03, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[23]['demand'] = demand
network[23]['supply'] = supply

network[24] = {'length': 0.03, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[24]['demand'] = demand
network[24]['supply'] = supply

network[25] = {'length': 0.03, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[25]['demand'] = demand
network[25]['supply'] = supply

network[26] = {'length': 0.03, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[26]['demand'] = demand
network[26]['supply'] = supply

network[27] = {'length': 0.03, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[27]['demand'] = demand
network[27]['supply'] = supply

network[28] = {'length': 0.03, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[28]['demand'] = demand
network[28]['supply'] = supply

network[29] = {'length': 0.03, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[29]['demand'] = demand
network[29]['supply'] = supply

network[30] = {'length': 0.03, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[30]['demand'] = demand
network[30]['supply'] = supply

network[31] = {'length': 0.03, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[31]['demand'] = demand
network[31]['supply'] = supply

network[32] = {'length': 0.03, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[32]['demand'] = demand
network[32]['supply'] = supply

network[33] = {'length': 0.03, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[33]['demand'] = demand
network[33]['supply'] = supply

network[34] = {'length': 0.03, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[34]['demand'] = demand
network[34]['supply'] = supply

network[35] = {'length': 0.03, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[35]['demand'] = demand
network[35]['supply'] = supply

network[36] = {'length': 0.03, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[36]['demand'] = demand
network[36]['supply'] = supply

network[37] = {'length': 0.03, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[37]['demand'] = demand
network[37]['supply'] = supply

network[38] = {'length': 0.03, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[38]['demand'] = demand
network[38]['supply'] = supply

network[39] = {'length': 0.03, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[39]['demand'] = demand
network[39]['supply'] = supply

network[40] = {'length': 0.03, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[40]['demand'] = demand
network[40]['supply'] = supply

network[41] = {'length': 0.03, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[41]['demand'] = demand
network[41]['supply'] = supply

network[42] = {'length': 0.03, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[42]['demand'] = demand
network[42]['supply'] = supply

network[43] = {'length': 0.03, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[43]['demand'] = demand
network[43]['supply'] = supply

network[44] = {'length': 0.03, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[44]['demand'] = demand
network[44]['supply'] = supply

network[45] = {'length': 0.03, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[45]['demand'] = demand
network[45]['supply'] = supply

network[46] = {'length': 0.03, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[46]['demand'] = demand
network[46]['supply'] = supply

network[47] = {'length': 0.03, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[47]['demand'] = demand
network[47]['supply'] = supply

network[48] = {'length': 0.03, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[48]['demand'] = demand
network[48]['supply'] = supply

network[49] = {'length': 0.03, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[49]['demand'] = demand
network[49]['supply'] = supply

network[50] = {'length': 0.03, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[50]['demand'] = demand
network[50]['supply'] = supply

network[52] = {'length': 0.04, 'vmax': 48, 'dmax': 208, 'source': 0, 'sink': 0}
network[52]['demand'] = demand
network[52]['supply'] = supply

# Define Junction Characteristics
# To unambiguously describe a traffic network, a description of the junctions is required
# Each junction i in (1, n) must be prescribed:
#   in  - a list of the road indexes which feed traffic IN to junction i
#   out - a list of the road indexes which lead OUT from junction i
#   tdm - a unique traffic distribution matrix
#
# The Traffic Distribution Matrix, A
#   The general junction with m incoming roads and n outgoing roads
#   A has m rows, n columns
#   The elements A=(a)_mn describe the proportion of traffic leaving incoming road m and travelling on outgoing road n
#   The sum of a_mn over index m is 1, as all traffic must leave its current road and also be conserved
#   The numpy syntax for arrays in 1D is [a, b, c, ...] so for 2D arrays each of a, b, c, .. are replaced by arrays:
#       [ [a11, a12, a13, ...], [a21, a22, a23, ...], [a31, a32, a33, ...], ... ]

junction_info = {}

# Junction template
# junction_info[id] = {'in': [ list of roads in by integer],
#                     'out': [ list of roads out by integer],
#                     'tdm': np.array([[first row of TDM elements], [second row of TDM elements], ...])}

# Junctions
junction_info[1] = {'in': [1, 38], 'out': [21], 'tdm': np.array([[1], [1]])}
junction_info[2] = {'in': [21], 'out': [11, 36], 'tdm': np.array([[0.6, 0.4]])}
junction_info[3] = {'in': [12, 36], 'out': [22], 'tdm': np.array([[1], [1]])}
junction_info[4] = {'in': [22], 'out': [20, 37], 'tdm': np.array([[0.5, 0.5]])}
junction_info[5] = {'in': [37, 19], 'out': [23], 'tdm': np.array([[1], [1]])}
junction_info[6] = {'in': [23], 'out': [10, 38], 'tdm': np.array([[0.4, 0.6]])}

junction_info[7] = {'in': [11, 41], 'out': [24], 'tdm': np.array([[1], [1]])}
junction_info[8] = {'in': [24], 'out': [2, 39], 'tdm': np.array([[0.4, 0.6]])}
junction_info[9] = {'in': [3, 39], 'out': [25], 'tdm': np.array([[1], [1]])}
junction_info[10] = {'in': [25], 'out': [13, 40], 'tdm': np.array([[0.6, 0.4]])}
junction_info[11] = {'in': [14, 40], 'out': [26], 'tdm': np.array([[1], [1]])}
junction_info[12] = {'in': [26], 'out': [12, 41], 'tdm': np.array([[0.5, 0.5]])}

junction_info[13] = {'in': [13, 44], 'out': [27], 'tdm': np.array([[1], [1]])}
junction_info[14] = {'in': [27], 'out': [4, 42], 'tdm': np.array([[0.7, 0.3]])}
junction_info[15] = {'in': [5, 42], 'out': [28], 'tdm': np.array([[1], [1]])}
junction_info[16] = {'in': [28], 'out': [15, 43], 'tdm': np.array([[0.5, 0.5]])}
junction_info[17] = {'in': [43, 16], 'out': [29], 'tdm': np.array([[1], [1]])}
junction_info[18] = {'in': [29], 'out': [14, 44], 'tdm': np.array([[0.3, 0.7]])}

junction_info[31] = {'in': [51, 15], 'out': [52], 'tdm': np.array([[1], [1]])}

junction_info[19] = {'in': [52, 47], 'out': [30], 'tdm': np.array([[1], [1]])}
junction_info[20] = {'in': [30], 'out': [6, 45], 'tdm': np.array([[0.4, 0.6]])}
junction_info[21] = {'in': [7, 45], 'out': [31], 'tdm': np.array([[1], [1]])}
junction_info[22] = {'in': [31], 'out': [17, 46], 'tdm': np.array([[0.5, 0.5]])}
junction_info[23] = {'in': [46, 18], 'out': [32], 'tdm': np.array([[1], [1]])}
junction_info[24] = {'in': [32], 'out': [16, 47], 'tdm': np.array([[0.6, 0.4]])}

junction_info[25] = {'in': [17, 50], 'out': [33], 'tdm': np.array([[1], [1]])}
junction_info[26] = {'in': [33], 'out': [8, 48], 'tdm': np.array([[0.4, 0.6]])}
junction_info[27] = {'in': [9, 48], 'out': [34], 'tdm': np.array([[1], [1]])}
junction_info[28] = {'in': [34], 'out': [19, 49], 'tdm': np.array([[0.5, 0.5]])}
junction_info[29] = {'in': [49, 20], 'out': [35], 'tdm': np.array([[1], [1]])}
junction_info[30] = {'in': [35], 'out': [50, 18], 'tdm': np.array([[0.4, 0.6]])}