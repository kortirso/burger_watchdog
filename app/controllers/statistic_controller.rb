class StatisticController < ApplicationController
    def index

    end

    def load
        @workdays = Workday.all
        @workdays = @workdays.set_time(params["params"]["first"]) unless params["params"]["first"].empty?
        @workdays = @workdays.set_data(params["params"]["second"]) unless params["params"]["second"].empty?
        respond_to do |format|
            format.csv { send_data @workdays.build_csv({col_sep: ";", encoding: 'utf-8'})}
        end
    end

    def manager_load
        @managers = Manager.all
        @managers = @managers.set_time(params["params"]["first"]) unless params["params"]["first"].empty?
        @managers = @managers.set_data(params["params"]["second"]) unless params["params"]["second"].empty?
         respond_to do |format|
            format.csv { send_data @managers.build_csv({col_sep: ";", encoding: 'utf-8'})}
        end
    end
end