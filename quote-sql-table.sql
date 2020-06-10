CREATE DATABASE quote;
USE quote;

CREATE TABLE quotes (
    id INT NOT NULL UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    word VARCHAR(100) NOT NULL);

INSERT INTO quotes (id, quote)
    VALUES
    (NULL, "Live as if you were to die tomorrow. Learn as if you were to live forever.”),
    (NULL, "That which does not kill us makes us stronger."),
    (NULL, "Be who you are and say what you feel, because those who mind don’t matter and those who matter don’t mind.),
    (NULL, "“We must not allow other people’s limited perceptions to define us."),
    (NULL, "Do what you can, with what you have, where you are."),
    (NULL, "Be yourself; everyone else is already taken."),
    (NULL, "This above all: to thine own self be true."),
    (NULL, "If you cannot do great things, do small things in a great way."),
    (NULL, "If opportunity doesn’t knock, build a door."),
    (NULL, "Wise men speak because they have something to say; fools because they have to say something."),
    (NULL, "Strive not to be a success, but rather to be of value."),
    (NULL, "Two roads diverged in a wood, and I—I took the one less traveled by, And that has made all the difference."),
    (NULL, "Do not let what you cannot do interfere with what you can do."),
    (NULL, "Whenever you find yourself on the side of the majority, it is time to pause and reflect."),
    (NULL, "I haven’t failed. I’ve just found 10,000 ways that won’t work.");


