require 'spec_helper'

describe Connectator::Oracle::Connection do

  describe "initalized with no params" do
    Then { lambda { Connectator::Oracle::Connection.new() }.should raise_error /Connection Options are required/  }
  end
  
  describe "initalized with basic params" do
    Given(:connection) {
      Connectator::Oracle::Connection.new(:server    => 'Server',
                                          :port      => 'Port',
                                          :username  => 'User',
                                          :password  => 'Pass',
                                          :instance  => 'Instance')
    }                                    

    Then { connection.connection_params.server.should       == 'Server'   }
    Then { connection.connection_params.port.should         == 'Port'     }
    Then { connection.connection_params.username.should     == 'User'     }
    Then { connection.connection_params.password.should     == 'Pass'     }
    Then { connection.connection_params.instance.should     == 'Instance' }
    
    Then { connection.connection_string.should == 'DBI:OCI8://Server:Port/Instance' }
  end
end
