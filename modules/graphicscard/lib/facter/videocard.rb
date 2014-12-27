# Josko Plazonic - lifted from Josko March 14, 2011 by Thomas Uphill
require 'facter'

Facter.add("videocard") do
        confine :kernel => :linux
        ENV["PATH"]="/bin:/sbin:/usr/bin:/usr/sbin"
        setcode do
                controllers = []
                lspciexists = system "/bin/bash -c 'which lspci >&/dev//null'"
                if $?.exitstatus == 0
                        output = %x{lspci}
                        output.each_line {|s|
                                controllers.push($1) if s =~ /VGA compatible controller: (.*)/
                        }
                end
                controllers
        end
end
