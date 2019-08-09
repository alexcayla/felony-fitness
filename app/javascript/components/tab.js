const schedule = document.querySelector(".schedule");
const location = document.querySelector(".location");
const review = document.querySelector(".reviews");
const navLinks = document.querySelectorAll(".nav-link")

const tabs = () => {
  navLinks.forEach((link) => {
    link.addEventListener("click", (e) => {
      e.preventDefault();
      if (e.currentTarget.classList.contains("sched-link")) {
        link.nextElementSibling.classList.remove('active');
        link.nextElementSibling.nextElementSibling.classList.remove('active');
        e.currentTarget.classList.add('active');
        location.classList.add('d-none');
        review.classList.add('d-none');
        schedule.classList.remove('d-none');
      } else if (e.currentTarget.classList.contains("loc-link")) {
        link.previousElementSibling.classList.remove('active');
        link.nextElementSibling.classList.remove('active');
        e.currentTarget.classList.add('active');
        schedule.classList.add('d-none');
        review.classList.add('d-none');
        location.classList.remove('d-none');
      } else if (e.currentTarget.classList.contains("rev-link")) {
        link.previousElementSibling.classList.remove('active');
        link.previousElementSibling.previousElementSibling.classList.remove('active');
        review.classList.toggle('d-none');
        schedule.classList.add('d-none');
        location.classList.add('d-none');
        e.currentTarget.classList.remove('active');
      }
    });
  });
};

export { tabs };
