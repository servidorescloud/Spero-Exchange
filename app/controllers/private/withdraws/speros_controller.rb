module Private::Withdraws
  class SperosController < ::Private::Withdraws::BaseController
    include ::Withdraws::Withdrawable
  end
end
