module Private
  module Deposits
    class SperosController < ::Private::Deposits::BaseController
      include ::Deposits::CtrlCoinable
    end
  end
end
