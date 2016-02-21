require "wakeup/version"
require "socket"

module Wakeup
  extend self

  def mac_address_valid?(mac)
    mac =~ /^([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}$/
  end

  def lookup_mac(hostname)
    `arp #{hostname} | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}'`
  end

  class Waker
    def self.wake(hostname, mac_addr)
      udp_sock = UDPSocket.new
      udp_sock.setsockopt(Socket::SOL_SOCKET, Socket::SO_BROADCAST, true)
      address = mac_addr.split(":").map(&:hex).map(&:chr).inject(:+).force_encoding("UTF-8")
      data = "\xFF\xFF\xFF\xFF\xFF\xFF" + (address * 16) # Purposefully using double quotes
      udp_sock.send(data, 0, "<broadcast>", Wakeup::PORT) # Need to send this before in order for it to work
      udp_sock.send(data, 0, hostname, Wakeup::PORT)
      puts "Wakeup command sent to host #{hostname}"
    end
  end

end
