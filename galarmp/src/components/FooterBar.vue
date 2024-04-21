<!-- Footer element for quick links -->
<template>
    <div class="footer">
        <div class="info">
            <div><a href="mailto:galarmp@gmail.com">galarmp@gmail.com</a></div>
            <div><a href="tel:+3725140807">+372 514 0807</a></div>
            <div><a href="https://www.linkedin.com/company/galarmp/">LinkedIn</a></div>
        </div>
    </div>
</template>

<style scoped>
a {
    background-color: transparent;
    color: #32455a
}

.footer {
    border-top: solid;
    border-color: #32455a;
    padding-top: 2em;
    padding-bottom: 2em;
}

.info {
    max-width: fit-content;
    margin-left: auto;
    margin-right: auto;
    display: flex;
}

@media (max-width: 1024px) {
  .info {
    display: inline-block;
    text-align: center;
  }

  .footer {text-align: center;}
}
</style>