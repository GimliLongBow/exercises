defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :neptune | :uranus

  @earth_seconds_in_year 31557600
  @planet_factors %{
    earth: 1,
    mercury: 0.2408467,
    venus: 0.61519726,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132
  }

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    seconds
    |> to_years
    |> to_planet(planet)
  end

  defp to_years(seconds) do
    seconds / @earth_seconds_in_year
  end

  defp to_planet(years, planet) do
    years / @planet_factors[planet]
  end
end
