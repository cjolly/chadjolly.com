class PagesController < ApplicationController
  def home

  end

  def packers
    @page_title = "My Packers Season Tickets Story | Chad Jolly"
    @meta_description = "I've been on the Packers season ticket waiting list for 30 years. This is my story."

    @data_points = {
      'Chad' => [
        [2003, 714],
        [2004, 673],
        [2005, 656],
        [2006, 629],
        [2007, 607],
        [2008, 591],
        [2009, 544],
        [2010, 480],
        [2011, 448],
        [2012, 415]
      ],

      'Emily' => [
        [2003, 2652],
        [2004, 2589],
        [2005, 2552],
        [2006, 2497],
        [2007, 2443],
        [2008, 2357],
        [2009, 2217],
        [2010, 2081],
        [2011, 2000],
        [2012, 1949]
      ],

      'Amy' => [
        [2003, 2653],
        [2004, 2590],
        [2005, 2553],
        [2006, 2498],
        [2007, 2444],
        [2008, 2358],
        [2009, 2218],
        [2010, 2082],
        [2011, 2001],
        [2012, 1950]
      ]
    }
  end

  def weather
    @station_id = ENV['WEATHER_STATION_ID']
  end

  def radbuff
    @page_title = "Radio Sync | Sync Radio Broadcast to Action on TV"
    @meta_description = "A web app that allows you to listen to your favorite local sports radio broadcast and sync it to the action on the TV, eliminating the delay"
  end

  def errors
    if params[:ua]
      Rails.logger.error %(at=error type=browser_not_supported desc="#{params[:ua]}")
    elsif params[:denied]
      Rails.logger.error %(at=error type=user_denied desc="#{params[:denied]}")
    end
    head :ok
  end
end
