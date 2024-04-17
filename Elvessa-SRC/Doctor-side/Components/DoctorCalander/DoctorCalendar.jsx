// calendar to let the doctor to add notes to dates based on appointments he gets

import React, { useState } from "react";
import { render } from "react-dom";
import ReactCalendar from "react-calendar";
import "./DoctorCalendar.css";

const DoctorCalendar = () => {
  const [date, setDate] = useState(new Date());
  const [notes, setNotes] = useState({});

  const onChange = date => {
    setDate(date);
  };

  const addNote = () => {
    const note = prompt("Enter a note:");
    if (note) {
      setNotes(prevNotes => ({
        ...prevNotes,
        [date.toDateString()]: [...(prevNotes[date.toDateString()] || []), note]
      }));
    }
  };

  const removeNote = index => {
    setNotes(prevNotes => {
      const updatedNotes = [...prevNotes[date.toDateString()]];
      updatedNotes.splice(index, 1);
      return { ...prevNotes, [date.toDateString()]: updatedNotes };
    });
  };

  return (
    <div>
      <ReactCalendar showWeekNumbers onChange={onChange} value={date} />
      <div>
        <button onClick={addNote}>Add Note</button>
        {notes[date.toDateString()] &&
          notes[date.toDateString()].map((note, index) => (
            <div key={index}>
              <span>{note}</span>
              <button onClick={() => removeNote(index)}>Remove</button>
            </div>
          ))}
      </div>
    </div>
  );
};

render(<DoctorCalendar />, document.querySelector("#root"));

export default DoctorCalendar;
