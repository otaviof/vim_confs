import vim
import socket

def runner(content):
    s = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
    try:
        s.connect("/Users/ofernandes/.ipython/IPYS")
        s.send(content)
        s.close()
    except:
        print "Error: could not connect to iPython server."

# --- Functions for running code in iPython --------------------------------- #

def run_current_line():
    runner(vim.current.line)

def run_selection():
    runner("\n".join(vim.current.range))

def run_buffer():
    runner("\n".join([vim.current.buffer] + ["\n"]))

def run_function(func_with_params):
    module_name = vim.current.buffer.name.split('.')[0]
    module_name = module_name.split('/')[-1]
    reload_command = "import %s; reload(%s)" % (module_name, module_name)
    func_line = "%s.%s" % (module_name,
                           func_with_params)
    runner("\n".join([reload_command, func_line]))

# --- Clean up function

def remove_sockets():
    import os
    import sys
    os.remove("/Users/ofernandes/.ipython/IPYS")
