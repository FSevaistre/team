<template>
  <div class="container fluid">
    <div class="view">
      <h3> {{ event.title }} </h3>
      <v-tabs dark fixed icons centered  v-model="active">
        <v-tabs-bar slot="activators" class="indigo darken-3">
          <v-tabs-item href='#tab-1'>
            <v-icon>event</v-icon>
            Description
          </v-tabs-item>
          <v-tabs-item href='#tab-2'>
            <v-icon>place</v-icon>
            Lieu
          </v-tabs-item>
          <v-tabs-item href='#tab-3'>
            <v-icon>group</v-icon>
            Joueurs
          </v-tabs-item>
          <v-tabs-slider class="white"></v-tabs-slider>
        </v-tabs-bar>
        <v-tabs-content key='1' id='tab-1'>
          <v-card flat>
            <v-card-text>
              <h4> {{ event.title }} </h4>
              <h5>
                {{ event.startDate }} 
                {{ event.endDate }}
              </h5>
              <p> {{ event.description }} </p>
            </v-card-text>
          </v-card>
        </v-tabs-content>
        <v-tabs-content key='2' id='tab-2'>
          <v-card flat>
            <v-card-text>
              <h4> Lieu du rendez vous </h4>
              <div class="fluid centered">
                <gmap-map
                  :center="center"
                  :zoom="7"
                  map-type-id="terrain"
                  style="width: 500px; height: 300px"
                >
                  <gmap-marker
                    :position="event.location"
                    :clickable="true"
                    :draggable="true"
                    @click="center=event.location"
                  ></gmap-marker>
                </gmap-map>
              </div>
            </v-card-text>
          </v-card>
        </v-tabs-content>
        <v-tabs-content key='3' id='tab-3'>
          <v-card flat>
            <v-card-text>joueurs</v-card-text>
          </v-card>
        </v-tabs-content>
      </v-tabs>
    </div>
  </div>
</template>

<script>
  import moment from 'moment'
  import * as VueGoogleMaps from 'vue2-google-maps';
  import Vue from 'vue';

  Vue.use(VueGoogleMaps, {
    load: {
      key: 'AIzaSyDBRCzYld4wasL5ebC2dqQ5zlmqlZ2GnSk',
      v: '3.26'
    }
  });

  export default {
    data() {
      return {
        event: {
          title: "Titre de l'événement",
          description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce non justo pharetra, efficitur enim sit amet, pretium ante. Praesent vitae condimentum orci, vel ultricies nisi. Nulla euismod orci sit amet leo congue, vitae tempus ipsum laoreet. Donec auctor, diam eget aliquet porta, nunc metus accumsan lorem, quis euismod nisi neque sed augue. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Phasellus molestie magna vel nibh rutrum maximus. Donec nec sollicitudin lectus. In malesuada rutrum viverra. Sed porta dui ante, sagittis lacinia sapien imperdiet eu.",
          startDate: moment().format(),
          endDate: moment().format(),
          location: { lat: 48.843205, lng: 2.310322 }
        },
	active: null,
        center: { lat: 48.843205, lng: 2.310322 }
      }
    },
    methods: {
      next () {
        this.active = this.tabs[(this.tabs.indexOf(this.active) + 1) % this.tabs.length]
      }
    },
    mounted() {
      Vue.$gmapDefaultResizeBus.$emit('resize')
   }
  }
</script>
