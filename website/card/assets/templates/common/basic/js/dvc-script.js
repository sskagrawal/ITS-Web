var shareModal = document.getElementById('shareModal');

window.onclick = function (event) {
    if (event.target == imageModal || event.target == shareModal) {
        shareModal.style.display = 'none';
    }
};

// Get the modal
var shareModal = document.getElementById('shareModal');

function openShareModal(e, title) {
    if (navigator.share) {
        navigator.share({
            title,
            url: window.location.href,
        }).then(() => {
            console.log('Thanks for sharing!');
        })
            .catch(console.error);
    } else {
        shareModal.style.display = 'flex';
    }
}

// Get the <span> element that closes the modal
const shareModalClose = document.getElementById('shareModalClose');

// When the user clicks on <span> (x), close the modal
shareModalClose.onclick = function () {
    shareModal.style.display = 'none';
};