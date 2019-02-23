module Private
  module Deposits
    class MxtsController < ::Private::Deposits::BaseController
      include ::Deposits::CtrlCoinable
    end
  end
end
