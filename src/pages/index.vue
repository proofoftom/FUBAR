<template>
  <div>
    <div v-if="isMetamask()">
      <img src="../assets/fp.png" alt="Fooby" style="float: left; width:37%;">
      <q-page style="float: right; padding-right: 10rem">
        <div>
          <h2></h2>
          <form @submit.prevent="handleSubmit()">
            <label for="nickname">Nickname</label><q-input name="nickname" placeholder="What shall we call you?" required></q-input>
            <br>
            <label for="team">Team</label><q-input name="team" placeholder="Team Name" required></q-input>
            <br>
            <label for="birthdate">DOB</label><q-datetime name="birthdate" placeholder="Birthdate" v-model="birthdate" default-value="April 15, 2000" required></q-datetime>
            <br>
            <label for="wallet">Wallet</label><q-input name="wallet" v-model="wallet" disabled></q-input>
            <br>
            <button type="submit">Submit</button>
          </form>
        </div>
      </q-page>
    </div>
    <div v-else class="flex flex-center" style="position: absolute; top: 50%; left: 50%;">
      <section>Please login to Metamask to register</section>
    </div>
  </div>
</template>

<style>
  input {
    width: 500px !important;
    line-height: 50px;
  }
</style>

<script>
var Web3 = require('web3')
var web3 = new Web3(Web3.givenProvider)
// new web3.eth.Contract('0x2941deaad71adb02b944bd38ebce2f1f4c9a62dc')
// var toAddress = '0x961568A3978BaD7842A1198159571eD6C7Aa2EAC';

export default {
  name: 'PageIndex',

  data () {
    return {
      wallet: null,
      birthdate: null
    }
  },

  mounted () {
    this.getWalletAddress()
  },

  methods: {
    getWalletAddress () {
      web3.eth.getCoinbase().then((walletAddress) => {
        this.wallet = walletAddress
      })
    },

    isMetamask () {
      if (this.wallet === null) {
        return false
      } else {
        return true
      }
    },

    handleSubmit () {
      window.location.href = 'thanks'
    }
  }

}
</script>
