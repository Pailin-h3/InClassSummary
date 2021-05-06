<template>
  <div class="card-content">
    <b-navbar>
      <template slot="start">
        <b-navbar-item tag="router-link" :to="{ path: '/' }">Home</b-navbar-item>
        <b-navbar-item tag="router-link" :to="{ path: '/ex01' }">Example 01</b-navbar-item>
        <b-navbar-item tag="router-link" :to="{ path: '/ex02' }">Example 02</b-navbar-item>
        <b-navbar-item tag="router-link" :to="{ path: '/ex03' }">Example 03</b-navbar-item>
        <b-navbar-item tag="router-link" :to="{ path: '/ex04' }">Example 04</b-navbar-item>
      </template>
    </b-navbar>
  </div>
</template>