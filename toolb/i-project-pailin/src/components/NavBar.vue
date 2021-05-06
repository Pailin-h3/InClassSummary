<template>
  <div class="card-content">
    <b-navbar>
      <template slot="start">
        <b-navbar-item tag="router-link" :to="{ path: '/' }">Home</b-navbar-item>
        <!-- <b-navbar-item tag="router-link" :to="{ path: '/test' }">Mine Test</b-navbar-item> -->
        <b-navbar-item tag="router-link" :to="{ path: '/easy' }">easy</b-navbar-item>
        <b-navbar-item tag="router-link" :to="{ path: '/normal' }">normal</b-navbar-item>
        <b-navbar-item tag="router-link" :to="{ path: '/hard' }">hard</b-navbar-item>
      </template>
    </b-navbar>
  </div>
</template>