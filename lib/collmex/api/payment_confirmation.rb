# http://www.collmex.de/cgi-bin/cgi.exe?1005,1,help,api_Payment

class Collmex::Api::PaymentConfirmation < Collmex::Api::Line
  def self.specification
    [
      { name: :satzart,                   type: :string,  const: "PAYMENT_CONFIRMATION" },
      { name: :kundenauftrag_nr,          type: :integer                                },
      { name: :datum_der_zahlung,         type: :date                                   },
      { name: :zahlbetrag,                type: :currency                               },
      { name: :gebuehr,                   type: :currency                               },
      { name: :waehrung,                  type: :string                                 },
      { name: :paypal_mailadresse,        type: :string                                 },
      { name: :paypal_transaktionsnummer, type: :string                                 },
    ]
  end
end
