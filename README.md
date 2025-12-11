[![CircleCI](https://dl.circleci.com/status-badge/img/gh/sul-dlss/sdr_view_components/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/sul-dlss/sdr_view_components/tree/main)
[![codecov](https://codecov.io/github/sul-dlss/sdr_view_components/graph/badge.svg?token=VGFL92KY3E)](https://codecov.io/github/sul-dlss/sdr_view_components)
[![Gem Version](https://badge.fury.io/rb/sdr_view_components.svg)](https://badge.fury.io/rb/sdr_view_components)

# SdrViewComponents

A rails gem to provide reusable view components used throughout the SDR applications and implement
component library assets.

# Installation

Add to gemfile:

```
gem 'sdr_view_components'
```

## Requirements

This set of components relies on the component library stylesheets, add:

```
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/sul-dlss/component-library@v2025-09-11/styles/sul.css">
```

with the most recent date tagged release to your `application.html.erb` layout file.

## Usage

### Add the SUL Header to your application

Supported header variations are `:dark`, `:light`, and `:white` (default is `:light`)

```
<%= render SdrViewComponents::Structure::HeaderComponent.new(title: 'Test Header', subtitle: 'Test Subtitle', variant: :dark) do |header| %>
  <% header.with_primary_navigation_link do %>
    <%= render SdrViewComponents::Elements::Navigation::NavItemComponent.new(text: 'Home', path: '#') %>
  <% end %>
  <% header.with_primary_navigation_link do %>
    <%= render SdrViewComponents::Elements::Navigation::DropdownMenuComponent.new(text: 'Logged in: amcollie-preview-dropdown') do |dropdown| %>
      <% dropdown.with_item do %>
        <%= link_to 'Logout', '/Shibboleth.sso/Logout', class: 'dropdown-item' %>
      <% end %>
    <% end %>
    <%# ... all primary nav links %>
  <% end %>
  <% header.with_secondary_navigation_link do %>
    <%= render SdrViewComponents::Elements::Navigation::NavItemComponent.new(text: 'Option', path: '/item1') %>
    <%# ... all secondary nav links>
  <% end %>
<% end %>
```

The `:dark` variation supports providing an rgb value via the `background_color` param in order to override the default dark background, for example:

```
<%= render SdrViewComponents::Structure::HeaderComponent.new(title: 'Test Header', subtitle: 'Test Subtitle', variant: :dark, rgb_color_str: '1, 104, 149') do |header| %>

...

<% end %>
```

By default, the SUL Rosette is included in the header, this can be disabled by setting `rosette: false` in the parameter list when instantiating the header.

### General usage:

```
<% render SdrViewComponent::....>
```
