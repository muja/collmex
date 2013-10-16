module Collmex
  class << self

    attr_accessor :benutzer, :passwort, :kundennummer

    def setup_login_data(logindata)
      Collmex.benutzer     = logindata[:benutzer]
      Collmex.passwort     = logindata[:passwort]
      Collmex.kundennummer = logindata[:kundennummer]
    end

    def reset_login_data
      Collmex.benutzer    = nil
      Collmex.passwort    = nil
      Collmex.kundennummer = nil
    end

    def csv_opts
      {
        col_sep: ";"
      }
    end

  end
end

require 'collmex/api'
require 'collmex/patch'
require 'collmex/request'
require 'collmex/response'

Collmex::Patch.apply_patches