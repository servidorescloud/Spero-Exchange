module Private::Withdraws
  class LtcsController < ::Private::Withdraws::BaseController
    include ::Withdraws::Withdrawable
  end
end
